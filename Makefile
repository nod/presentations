
view: presentation.html
	open presentation.html

presentation.html: pres.md
	landslide -t ../theme pres.md

clean:
	rm -f presentation.html presbundle.html

bundle: pres.md
	landslide -t ../theme --embed -d presbundle.html pres.md

