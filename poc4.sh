. ./poc4.lib.sh

USE demo;
FROM input | {
	WHERE grep1 grep2 grep3 | {
		SELECT cut1 | {
			ORDERBY sort1 | {
				OUTPUT;
			};
		};
	};
}

# USE demo; FROM input | WHERE grep1 grep2 grep3 | SELECT cut1 | ORDERBY sort1 | OUTPUT

