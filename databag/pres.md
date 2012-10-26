
# databag

- jeremy kelley
- @nod
- oct 25, 2012 - awpug

---

# premature optimization

developers often suffer from this severe and potentially embarassing condition
but are often afraid to admit it

---

# what can we do?

being overly concerned about performance can really exacerbate this problem

just code on something fun, the problem will often take care of itself

use a simple tool that's easy to develop with but may not be optimal for
serving ALL THE PEOPLE ALL THE TIME

---

# which brings us to databag

schemaless wrapper, document oriented store, on top of sqlite

---

## ok, why?

tiny VMs are cheap and ubiquitous, limited resources

<small>
numerous use cases beyond frugal hosting if you consider transient compute
nodes, collection nodes, queue based parallelization...
</small>

---

## alternatives?

couldn't find a good pure py, but cross language, nosqlish flat file db

  - pickle?  no.
  - shelve? no querying.
  - json to big text file? ha.
  - &lt;insert whatever else here&gt;? maybe...

note: goatfish & dumptruck... but I don't like their query options

---

# So tell me... what does a dbag look like?

---

## this.

    !pycon
    >>> from databag import DataBag
    >>> d = DataBag(table='dbag', fpath='/tmp/mybag')
    >>> d.add('asdfasdf')
    '57efgS2jKc8bp4pje5pgaW'
    >>> d[_]
    u'asdfasdf'
    >>> d.add({'name':'jeremy'})
    '9rmcDpK7FTwQR8jMj2tcoC'
    >>> d[_]
    {u'name': u'jeremy'}

what were you expecting?

---

# But what about DictBags?

In databag, the really useful stuff is a funly class named DictBag.

# also, I like saying dictbag

![bunk](bunk.gif)

---

## the codes

    !pycon
    >>> from databag import DictBag
    >>> d = DictBag('dbag')
    >>> d.ensure_index( ('name','age') )
    >>> d.add( {'name': 'joe', 'age': 23} )
    '6xDZzTgccXCRLdp4ADjxaa'
    >>> d.add( {'name': 'jill', 'age': 50} )
    '73B5oGX5yFm4GWWpl1pzxg'
    >>> d['73B5oGX5yFm4GWWpl1pzxg']
    {u'age': 50, u'name': u'jill'}

---

## HOW ABOUT SOME QUERIES!

    !pycon
	  ... continued ...

    >>> d.find(name='jill')
    <generator object <genexpr> at 0x109f9b320>

---

## AND SOME QUERIES!

    !pycon
	  ... continued ...

    >>> d.find(name='jill').next()
    (u'73B5oGX5yFm4GWWpl1pzxg', {u'age': 50, u'name': u'jill'})

---

## AND THESE QUERIES!

    !pycon
	  ... continued ...

    >>> d.find({'name':'jill'}).next()
    (u'73B5oGX5yFm4GWWpl1pzxg', {u'age': 50, u'name': u'jill'})

---

## AND THOSE QUERIES

    !pycon
	  ... continued ...

    >>> d.find({'age': {'$gt': 40}}).next()
    (u'73B5oGX5yFm4GWWpl1pzxg', {u'age': 50, u'name': u'jill'})

---

## parting thoughts

it works well with DictShield/Schematics by James Dennis (@j2labs)

It does much more, has pretty good test coverage and the README has more
examples, as does the source.

I'm using it in production for personal stuff.

WARNING - alpha quality right now.  well tested but we're still talking about
data stores so should be extra careful

---

# thanks

find me online: @nod

find the code at: `github.com/nod/databag`

![bathtubs](bathtubs.jpg)

