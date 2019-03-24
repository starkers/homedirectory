#!/usr/bin/env python3

import re
import os


def isPDF(input):
    match = re.search('pdf', input)
    if match:
        return True
    else:
        return False


x = [f.name for f in os.scandir() if f.is_file()]

# print(len(x))

for a in x:
    # print(a)
    if isPDF(a):
        # print("YES: {}".format(a))
        name = a.split("--")[0]
        acc = a.split("--")[1]
        dates_full = a.split("--")[-1].split(".")[0]

        from_day = dates_full.split("-")[0]
        from_month = dates_full.split("-")[1]
        from_year = dates_full.split("-")[2]
        # print(from_year)

        to_day = dates_full.split("-")[3]
        to_month = dates_full.split("-")[4]
        to_year = dates_full.split("-")[5]

        if len(from_day) is 1:
            from_day = "0{}".format(from_day)
        if len(from_month) is 1:
            from_month = "0{}".format(from_month)
        if len(to_day) is 1:
            to_day = "0{}".format(to_day)
        if len(to_month) is 1:
            to_month = "0{}".format(to_month)

        dates = str("{}-{}-{}__{}-{}-{}".format(
            from_year,
            from_month,
            from_day,
            to_year,
            to_month,
            to_day))

        prefix = name + "-" + acc
        final = prefix + "--" + dates + ".pdf"
        print("{} -> {}".format(
            a,
            final))
        os.rename(a, final)

        # os.rename(a, final)

