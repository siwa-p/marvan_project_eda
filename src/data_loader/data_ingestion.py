from minio import Minio
from dotenv import load_dotenv
import os
import sys
import pandas as pd
from io import StringIO
current_path = os.path.dirname(os.path.abspath(__file__))
parent_path = os.path.abspath(os.path.join(current_path, '..', '..'))
sys.path.append(parent_path)
from src.logger import setup_logging
logger = setup_logging()
load_dotenv(override=True)

minio_access_key = os.getenv("MINIO_ACCESS_KEY")
minio_secret_key = os.getenv("MINIO_SECRET_KEY")
minio_url = os.getenv("MINIO_EXTERNAL_URL")
minio_bucket_name = os.getenv("MINIO_BUCKET_NAME")


def read_from_minio(minio_client, bucket_name, object_name):
    response = minio_client.get_object(bucket_name, object_name)
    csv_string = response.data.decode('utf-8')
    df = pd.read_csv(StringIO(csv_string))
    return df


def main():
    minio_client = Minio(minio_url, access_key=minio_access_key, secret_key=minio_secret_key, secure=False)
    # List all CSV files in the bucket
    objects = minio_client.list_objects(minio_bucket_name, recursive=True)
    csv_files = [obj.object_name for obj in objects if obj.object_name.endswith('.csv')]
    if not csv_files:
        logger.error("No CSV files found in the bucket.")
        sys.exit(1)
    os.makedirs('data', exist_ok=True)
    for file_name in csv_files:
        logger.info(f"Reading file: {file_name}")
        data = read_from_minio(minio_client, minio_bucket_name, file_name)
        local_path = os.path.join('data', os.path.basename(file_name))
        data.to_csv(local_path, index=False)
        logger.info(f"Saved {file_name} to {local_path}")
    
if __name__ == '__main__':
    main()