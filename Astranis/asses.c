#include <string.h>

char* strdup_every_other_char(const char* s) {
	char* retString;
	size_t sizeInputString;
	size_t sizeRetString;

	sizeInputString = strlen(s); 

	// Can replace ternary operator with always + 1, 
	// for better readability and slight performance bosst,
	// at slight cost of unused memory allocation.
	sizeRetString = (sizeInputString % 2 == 0) ? 
		(sizeInputString/2) : (sizeInputString/2 + 1);

	// + 1 for extra byte for null terminator
	retString = malloc(sizeRetString + 1); 

	for (int i = 0; i < (int)sizeRetString; i++) {
		retString[i] = s[i*2];
	}

	retString[sizeRetString] = '\0';

	return retString;
}
