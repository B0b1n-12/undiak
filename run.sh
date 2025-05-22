#!/bin/bash

# Název souboru
SOURCE="main.cpp"
OUTPUT="convert"

# Oprava Windows konců řádků, pokud existují
if command -v dos2unix &> /dev/null; then
  dos2unix "$SOURCE" 2>/dev/null
else
  echo "⚠️  dos2unix není nainstalovaný. Doporučuji nainstalovat: sudo apt install dos2unix"
fi

# Překlad pomocí g++
echo "🔧 Překlad souboru $SOURCE..."
g++ -std=c++17 -o "$OUTPUT" "$SOURCE"

# Kontrola, jestli kompilace proběhla úspěšně
if [ $? -eq 0 ]; then
  echo "✅ Překlad hotov. Spouštím program:"
  echo "-------------------------"
  ./"$OUTPUT"
else
  echo "❌ Chyba při překladu!"
fi

