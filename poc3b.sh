. ./poc3.lib.sh

IN demo;
GET input | {
	FILTER grep1 grep2 grep3 | {
		CONVERT cut1 sort1 | {
			OUTPUT;
		};
	};
}

IN demo; GET input | FILTER grep1 grep2 grep3 | CONVERT cut1 sort1 | OUTPUT

# IN demo; GET default input | FILTER grep1 grep2 grep3 | CONVERT cut1 sort1 | GET output

# patagrep IN demo GET input FILTER grep1 grep2 grep3 CONVERT cut1 sort1 OUTPUT as json
# patagrep IN demo [GET input] FILTER grep1 grep2 grep3 CONVERT cut1 sort1 [GET output]
