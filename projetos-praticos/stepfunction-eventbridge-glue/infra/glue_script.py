import sys
from datetime import datetime


def main():
    print(f"[{datetime.now()}] Inicio do Glue Job")
    print(f"[{datetime.now()}] Argumentos: {sys.argv}")
    print(f"[{datetime.now()}] Job executado com sucesso!")
    print(f"[{datetime.now()}] Fim do Glue Job")


if __name__ == "__main__":
    main()
