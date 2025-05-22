
#include <unordered_map>

char Diakritika::odstranitDiakritiku(char c) {
    static const std::unordered_map<char, char> diakritiky = {
        {'á', 'a'}, {'č', 'c'}, {'ď', 'd'}, {'é', 'e'}, {'ě', 'e'},
        {'í', 'i'}, {'ň', 'n'}, {'ó', 'o'}, {'ř', 'r'}, {'š', 's'},
        {'ť', 't'}, {'ú', 'u'}, {'ů', 'u'}, {'ý', 'y'}, {'ž', 'z'},
        {'Á', 'A'}, {'Č', 'C'}, {'Ď', 'D'}, {'É', 'E'}, {'Ě', 'E'},
        {'Í', 'I'}, {'Ň', 'N'}, {'Ó', 'O'}, {'Ř', 'R'}, {'Š', 'S'},
        {'Ť', 'T'}, {'Ú', 'U'}, {'Ů', 'U'}, {'Ý', 'Y'}, {'Ž', 'Z'}
    };

    auto it = diakritiky.find(c);
    return (it != diakritiky.end()) ? it->second : c;
}

std::string Diakritika::odstranitDiakritiku(const std::string& vstup) {
    std::string vystup;
    for (char c : vstup) {
        vystup += odstranitDiakritiku(c);
    }
    return vystup;
}

