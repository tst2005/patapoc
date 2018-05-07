load() { . ./pocfunc/$1; }

load cats; cat1 | {
	load greps; grep1 | grep2 | grep3 | {
		load cuts; cut1 | {
			load sorts; sort1 | {
				load cuts; cut2;
			};
		};
	};
}
#load cats ; cat1 | { load greps ; grep1 | grep2 | grep3; } | { load cuts ; cut1 | { load sorts ; sort1 | cut2; }; }
#load cats ; cat1 | { load greps ; grep1 | grep2 | grep3 | { load cuts ; cut1 | { load sorts ; sort1 | cut2; }; }; }

