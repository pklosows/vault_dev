BIN = ./script
KONF=$(BIN)/0-env.sh

all:
	@echo "-------------------------------------------"
	@echo "Dostępne akcje:"
	@echo "    1-start  - wystartowanie serwera w trybie -dev"
	@echo "    2-secret - stawienie tajnego hasła, odczytanie i usunięcie"
	@echo "    3-engine - dodanie silnika sekretów"
	@echo "    6-autent - wygenerowanie nowego klucza i zalogowanie się"
	@echo "    7-author - policy, autoryzacja"
	@echo "-------------------------------------------"

1-start:
	$(BIN)/1-start.sh $(KONF)

2-secret:
	$(BIN)/2-secret.sh $(KONF)

3-engine:
	$(BIN)/3-engine.sh $(KONF)

6-autent:
	$(BIN)/6-autent.sh $(KONF)

7-author: 6-autent
	$(BIN)/7-author.sh $(KONF)

clean:
	rm -f *.txt
