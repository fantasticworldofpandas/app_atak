# App de Pesquisa Atak

![App](projeto-atak/app_atak/lib/assets/app_atak.png)


Este é um aplicativo simples que permite realizar pesquisas e exibi os resultados em uma interface. O aplicativo é baseado em Flutter.

## Como Executar a aplicação

1. Clone o repositório para o seu ambiente local:

   ```bash
   git clone 
   ```

2. No caminho `projeto-atak/app_atak/lib/assets` execute o arquivo `api-route.py`

### Esse módulo requer a instalação das libs:

- Flask: use `pip install flask`.
- BeautifulSoup: use `pip install beautifulsoup4`.
- Requests: use `pip install requests`.
- Use `python api-route.py` para rodar o módulo de API.
- Por padrão, o servidor Flask é iniciado no localhost http://127.0.0.1:5000

---

3. Após isso, navegue até o diretório `cd app_atak`

3. Execute no terminal `flutter run`


# Estrutura do Projeto

## O projeto está organizado da seguinte forma:

- `lib/`: Contém o código-fonte do aplicativo.
- `main.dart`: Ponto de entrada do aplicativo.
- `providers/`: Armazena os provedores de dados (models).
- `screens/`: Contém as telas do aplicativo.
- `widgets/`: Armazena os widgets reutilizáveis.
-  Otilizei a lib `provider` para gerenciamento de estado.

### Autor
---

 <sub><b>Atevilson Freitas</b></sub></a> <a href="">🧑‍💻</a>