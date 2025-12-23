import csv

def load_data(filename):
    months = {
        'Jan': 0, 'Feb': 1, 'Mar': 2, 'Apr': 3,
        'May': 4, 'June': 5, 'Jul': 6, 'Aug': 7,
        'Sep': 8, 'Oct': 9, 'Nov': 10, 'Dec': 11
    }

    evidence = []
    labels = []

    with open(filename, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            evidence.append([
                int(row['Administrative']),
                float(row['Administrative_Duration']),
                int(row['Informational']),
                float(row['Informational_Duration']),
                int(row['ProductRelated']),
                float(row['ProductRelated_Duration']),
                float(row['BounceRates']),
                float(row['ExitRates']),
                float(row['PageValues']),
                float(row['SpecialDay']),
                months[row['Month']],
                int(row['OperatingSystems']),
                int(row['Browser']),
                int(row['Region']),
                int(row['TrafficType']),
                1 if row['VisitorType'] == 'Returning_Visitor' else 0,
                1 if row['Weekend'] == 'TRUE' else 0
            ])
            labels.append(1 if row['Revenue'] == 'TRUE' else 0)

    return evidence, labels
