import time

DEF_VERSION = 1

def main():
    while True:
        time.sleep(1)
        print(f"version-{DEF_VERSION}")


if __name__ == "__main__":
    main()
