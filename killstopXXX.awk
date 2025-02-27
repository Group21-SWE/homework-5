BEGIN {
    # Read stop words into an array
    while ((getline word < "stopwords.txt") > 0) {
        stopwords[word] = 1
    }
    close("stopwords.txt")
}

{
    # Process each word in the input file
    for (i = 1; i <= NF; i++) {
        if (!(tolower($i) in stopwords)) {
            printf "%s ", $i
        }
    }
    printf "\n"
}