import csv
import sys

def read_database(filename):
    with open(filename) as file:
        reader = csv.DictReader(file)
        return list(reader), reader.fieldnames[1:]

def read_sequence(filename):
    with open(filename) as file:
        return file.read().strip()

def longest_match(sequence, subsequence):
    longest = 0
    for i in range(len(sequence)):
        count = 0
        while sequence[i + count * len(subsequence): i + (count + 1) * len(subsequence)] == subsequence:
            count += 1
        longest = max(longest, count)
    return longest

def main():
    if len(sys.argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        sys.exit(1)

    database, strs = read_database(sys.argv[1])
    sequence = read_sequence(sys.argv[2])

    result = {str_: longest_match(sequence, str_) for str_ in strs}

    for person in database:
        if all(int(person[str_]) == result[str_] for str_ in strs):
            print(person['name'])
            return
    print("No match")

if __name__ == "__main__":
    main()
