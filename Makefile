# ============================================================
#  C-Learning v5.0.0 — MASTER CLASS
#  Makefile professionnel, optimisé, sécurisé, militaire-tech
# ============================================================

CC      := gcc
CSTD    := -std=c11

# -----------------------------
# Flags de compilation
# -----------------------------
WARN    := -Wall -Wextra -Werror
SECURE  := -fstack-protector-all -D_FORTIFY_SOURCE=2 -Wshadow -Wconversion -Wdouble-promotion
OPT     := -O3 -march=native -flto -funroll-loops -DNDEBUG
SAN     := -fsanitize=address -g

# -----------------------------
# Dossiers
# -----------------------------
SRC_BASIC        := $(wildcard src/basic/*.c)
SRC_INTERMEDIATE := $(wildcard src/intermediate/*.c)
SRC_ADVANCED     := $(wildcard src/advanced/*.c)
SRC_ARCHI        := $(wildcard src/architecture/*.c)
SRC_MASTER       := $(wildcard src/masterclass/*.c)

# -----------------------------
# Exécutables
# -----------------------------
EXE_BASIC        := $(SRC_BASIC:%.c=%)
EXE_INTERMEDIATE := $(SRC_INTERMEDIATE:%.c=%)
EXE_ADVANCED     := $(SRC_ADVANCED:%.c=%)
EXE_ARCHI        := $(SRC_ARCHI:%.c=%)
EXE_MASTER       := $(SRC_MASTER:%.c=%)

# ============================================================
#  Compilation standard
# ============================================================

all: basic intermediate advanced architecture masterclass
	@echo "[OK] Build complet MASTER CLASS terminé."

basic: $(EXE_BASIC)
	@echo "[OK] Compilation niveau BASIC terminée."

intermediate: $(EXE_INTERMEDIATE)
	@echo "[OK] Compilation niveau INTERMEDIATE terminée."

advanced: $(EXE_ADVANCED)
	@echo "[OK] Compilation niveau ADVANCED terminée."

architecture: $(EXE_ARCHI)
	@echo "[OK] Compilation niveau ARCHITECTURE terminée."

masterclass: $(EXE_MASTER)
	@echo "[OK] Compilation niveau MASTER CLASS terminée."

# ============================================================
#  Règle générique
# ============================================================

%: %.c
	$(CC) $(WARN) $(CSTD) $< -o $@

# ============================================================
#  Compilation optimisée (MASTER CLASS)
# ============================================================

optimize:
	@echo "[BUILD] Compilation OPTIMISÉE (v5.0.0)…"
	$(CC) $(WARN) $(OPT) $(SRC_MASTER) -o master_opt
	@echo "[OK] master_opt généré."

# ============================================================
#  Compilation sécurisée (MASTER CLASS)
# ============================================================

secure:
	@echo "[BUILD] Compilation SÉCURISÉE (v5.0.0)…"
	$(CC) $(WARN) $(SECURE) $(SRC_MASTER) -o master_sec
	@echo "[OK] master_sec généré."

# ============================================================
#  Compilation avec AddressSanitizer
# ============================================================

sanitize:
	@echo "[BUILD] Compilation SANITIZE (ASan)…"
	$(CC) $(WARN) $(SAN) $(SRC_MASTER) -o master_asan
	@echo "[OK] master_asan généré."

# ============================================================
#  Nettoyage
# ============================================================

clean:
	rm -f src/basic/*~ src/intermediate/*~ src/advanced/*~ \
	      src/architecture/*~ src/masterclass/*~ \
	      src/basic/*.o src/intermediate/*.o src/advanced/*.o \
	      src/architecture/*.o src/masterclass/*.o \
	      master_opt master_sec master_asan
	@echo "[CLEAN] Nettoyage complet effectué."

# ============================================================
#  Fin du Makefile MASTER CLASS
# ============================================================
