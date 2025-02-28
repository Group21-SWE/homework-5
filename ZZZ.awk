BEGIN {
    split("", top_words)
}
PASS == 1 {
    top_words[NR] = $0
}
PASS == 2 {
    if (NF == 0) {
        if (length(top_words) > 0) {
            for (i in top_words) {
                printf("%s:%d ",top_words[i], word_count[top_words[i]])
            }
            print ""
        }
        split("", word_count)
    } else {
        for (i = 1; i <= NF; i++) {
            word = tolower($i)
            if (word == top_words[1] || word == top_words[2] || word == top_words[3] || word == top_words[4] || word == top_words[5] || word == top_words[6] || word == top_words[7] || word == top_words[8] || word == top_words[9] || word == top_words[10]) {
                word_count[word]++
            }
        }
    }
}
END {
    for (i in top_words) {
        printf("%s:%d ", top_words[i], word_count[top_words[i]])
    }
    print ""
}