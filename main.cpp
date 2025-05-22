#ifndef DIAKRITIKA_H
#define DIAKRITIKA_H
#include "diakritika.h"
#include <string>

class Diakritika {
public:
    static char odstranitDiakritiku(char c);
    static std::string odstranitDiakritiku(const std::string& vstup);
};

#endif // DIAKRITIKA_H
