# Netflix Analytics with AWS Athena and Metabase

Projeto de análise de dados utilizando **AWS Athena** e **Metabase** para explorar e visualizar dados do catálogo e avaliações da Netflix.

Os dados brutos em formato **CSV** são armazenados no **Amazon S3** e consultados via **tabelas externas no Athena**.
A partir dessas tabelas, são criadas **consultas analíticas e views** que alimentam dashboards no Metabase.

---

# Arquitetura

![Arquitetura](docs/diagrama_projeto.png)

## Data Pipeline

O pipeline de dados segue o seguinte fluxo:

1. Arquivos CSV são armazenados no Amazon S3.
2. Tabelas externas são criadas no AWS Athena para leitura dos dados brutos.
3. Consultas SQL transformam e agregam os dados para análise.
4. Views analíticas são utilizadas como fonte para dashboards no Metabase.

---

# Tecnologias utilizadas

* AWS S3
* AWS Athena
* SQL
* Metabase
* Git / GitHub

---

# Modelagem de dados

O projeto segue uma separação simples de camadas:

**Raw**

Tabelas externas no Athena que apontam diretamente para os arquivos CSV armazenados no S3.

**Analytical**

Consultas SQL que transformam e agregam os dados para análise.

**Views**

Views finais utilizadas como fonte de dados para visualização no Metabase.

---

# Dashboard

O dashboard foi construído no **Metabase**, consumindo as views criadas no Athena.

---

# Objetivo do projeto

Demonstrar um fluxo simples de análise de dados utilizando ferramentas serverless da AWS:

* armazenamento de dados no S3
* consulta via Athena
* modelagem analítica em SQL
* visualização com Metabase

