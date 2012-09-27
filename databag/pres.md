
# databag

![dbag](dbag.png)

- jeremy kelley
- @nod
- sept 27, 2012

---

# premature escalation

developers from 15 to 50 suffer from this severe and potentially embarassing
condition but are often afraid to admit it


---

# what can we do?

being overly concerned about performance can really exacerbate this problem

just code on something fun, the problem will often take care of itself

use the proper tools

---

# databag

simple attempt at a document oriented, daemonless, pure python datastore

schemaless wrapper on top of sqlite

![dbag](dbag.png)

---

## ok, why?

tiny VMs are cheap and ubiquitous, limited resources

need a full blown db process hogging those resources?

deployment involves the process hitting a flat file

numerous use cases beyond frugal hosting if you consider transient compute
nodes, collection nodes, queue based parallelization...

---

## no, really. why this?

  - sqlite is solid... but, i'm a fan of nosql.
  - it's pythonic and simple to use.
  - makes data persistence crazy easy
  - offers versioning of data if you want it
  - transparently compresses (bz2) data as it goes in when useful to minimize
    growth of raw file
  - other reasons that are awesome

---

## are there alternatives?

couldn't find a good pure py, but cross language, nosqlish flat file db

  - pickle?  no.
  - json to text? ha.
  - tokyo cabinet? really?!
  - &lt;insert whatever else here&gt;? maybe...

note: goatfish & dumptruck... but I don't like their query options

---

# So tell me... what does a dbag look like?

---

## this.

what were you expecting?

    !pycon
    >>> from databag import DataBag
    >>> d = DataBag(fpath='/tmp/mybag')
    >>> d.add('asdfasdf')
    '57efgS2jKc8bp4pje5pgaW'
    >>> d[_]
    u'asdfasdf'
    >>> d.add({'name':'jeremy'})
    '9rmcDpK7FTwQR8jMj2tcoC'
    >>> d[_]
    {u'name': u'jeremy'}

---

# But what about DictBags?

In databag, the really useful stuff is a funly class named DictBag.

---

# also, I like saying dictbag

![bunk](bunk.gif)

---

## the codes

    !pycon
    >>> from databag import DictBag, Q
    >>> d = DictBag()
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
    >>> d.find(name='jill')
    <generator object <genexpr> at 0x109f9b320>

    >>> d.find(name='jill').next()
    (u'73B5oGX5yFm4GWWpl1pzxg', {u'age': 50, u'name': u'jill'})

    >>> d.find(Q('age')>40).next()
    (u'73B5oGX5yFm4GWWpl1pzxg', {u'age': 50, u'name': u'jill'})

    >>> for k, rec in d.find(1<Q('age')<60):
    ...   print k, rec
    XCRLdp4ADjxaa {u'age': 23, u'name': u'joe'}
    73B5oGX5yFm4GWWpl1pzxg {u'age': 50, u'name': u'jill'}

---

## Where Can I Get This?!1?!11?!

latest source can be found at github.com/nod/databag

It's in pypi but the version is older and buggier.  Will update soon.

---

## parting thoughts

it works awesomely with DictShield/Schematics by James Dennis

It does much more, has pretty good test coverage and the README has more
examples, as does the source.

I'm using it in production for personal stuff.

alpha quality right now

---

# thanks

Jeremy Kelley, @nod, jeremy@33ad.org

github.com/nod/databag

![bathtubs](bathtubs.jpg)


