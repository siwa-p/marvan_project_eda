# COVID-19 Data EDA Project

This project provides workflows for exploratory data analysis (EDA) of COVID-19 datasets, including data ingestion from APIs and MinIO object storage using Python.

## Project Structure

- `src/`: Source code
  - `data_loader/`: Scripts for ingesting data from APIs and MinIO
  - `logger.py`: Custom JSON logger for consistent logging
  - `eda.ipynb`: Jupyter notebook for EDA
- `data/`: Downloaded and processed data files (CSV)
- `logs/`: Application logs
- `tests/`: Unit tests

## Data Ingestion

- **API Ingestion:**  
  The script [`src/data_loader/api_ingestion.py`](src/data_loader/api_ingestion.py) fetches COVID-19 time series data from a public API, saves it as a DataFrame, and uploads it to MinIO object storage.
- **MinIO Ingestion:**  
  The script [`src/data_loader/data_ingestion.py`](src/data_loader/data_ingestion.py) downloads CSV files from a MinIO bucket and saves them locally in the `data/` directory.

## Exploratory Data Analysis

- EDA is performed in [`src/eda.ipynb`](src/eda.ipynb) using pandas and numpy.  
  The notebook loads the CSV data, inspects structure, and summarizes key statistics.

## Setup

1. Clone the repository.
2. Configure your `.env` file with MinIO and API credentials.
3. Use the data ingestion scripts to fetch and store data.
4. Open `eda.ipynb` to explore and analyze the data.

## Requirements

See [`requirements.txt`](requirements.txt) for Python dependencies.

## Logging

All scripts use a custom JSON logger ([`src/logger.py`](src/logger.py)) for both file and console output.
