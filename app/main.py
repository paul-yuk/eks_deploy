import time
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)


DEF_VERSION = 3


def main():
    while True:
        time.sleep(1)
        logging.info(f"version-{DEF_VERSION}")


if __name__ == "__main__":
    main()
