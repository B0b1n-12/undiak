import pandas as pd # type: ignore
data = {
    "Operace": ["Výpis textu", "Proměnná"],
    "Bash": ["echo \"Ahoj\"", "name=\"Echo\""],
    "Fish": ["echo \"Ahoj\"", "set name Echo"]
}
pd.DataFrame(data).to_csv("vystup.csv", index=False, encoding="utf-8")
 