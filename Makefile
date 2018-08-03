.PHONY: PITCHME.md

PITCHME.md:
	cat \
		0-intro.md \
		why-go.md \
		hello-world.md \
		concurrency.md \
		writing-tests.md \
		99-fin.md > PITCHME.md
