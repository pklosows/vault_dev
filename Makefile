BIN = ./script
KONF=$(BIN)/0-env.sh

all:
	@echo "-------------------------------------------"
	@echo "	Dostępne akcje:"
	@echo "		start - wystartowanie serwera w trybie -dev"
	@echo "		sekret - stawienie tajnego hasła, odczytanie i usunięcie"
	@echo "		silnik - dodanie silnika sekretów"
	@echo "		4-autent - wygenerowanie nowego klucza i zalogowanie się"
	@echo "		5-autor - policy, autoryzacja"
	@echo "-------------------------------------------"

start:
	$(BIN)/1-start.sh $(KONF)

sekret:
	$(BIN)/2-secret.sh $(KONF)

silnik:
	$(BIN)/3-engine.sh $(KONF)

4-autent:
	$(BIN)/4-autent.sh $(KONF)

5-autor: 4-autent
	$(BIN)/5-autor.sh $(KONF)

clean:
	rm -f *.txt
