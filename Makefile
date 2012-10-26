
view: presentation.html
	open presentation.html

presentation.html: pres.md
	landslide -t ../landslide.theme pres.md

clean:
	rm -f presentation.html presbundle.html

bundle: pres.md
	landslide -t ../landslide.theme --embed -d presbundle.html pres.md

