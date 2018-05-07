load() { . ./pocfunc/$1; }

# use "load filters"

load cats; cat1 | {
	load greps; grep1 | grep2 | grep3 | {
		load filters; cut1 | {
			sort1 | {
				cut2;
			};
		};
	};
}

