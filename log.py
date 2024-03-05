import psutil
import os
import datetime
import pandas as pd
import time


first=True
gpu_command = "nvidia-settings -q gpucoretemp | grep Attribute | cut -d':' -f4 | sed 's/[^0-9]//g'"
gpu_clocks_command = "nvidia-smi -q | grep 'MHz' | cut -d':' -f2 | head -n4"

while True:
    gpu = int(os.popen(gpu_command).read())
    gpu_freq = os.popen(gpu_clocks_command).read().strip().split('\n')
    cpu_freq = psutil.cpu_freq().current
    cpu = [
        i.current
        for i in psutil.sensors_temperatures()['coretemp']
    ]


    data = pd.DataFrame([{
        "time": str(datetime.datetime.now()),
        "gpu": gpu,
        "package": cpu[0],
        "cpu0": cpu[1],
        "cpu1": cpu[2],
        "cpu2": cpu[3],
        "cpu3": cpu[4],
        "cpu4": cpu[5],
        "cpu5": cpu[6],
        "cpu_freq": cpu_freq,
        "gpu_freq0": gpu_freq[0].replace("MHz","").strip(),
        "gpu_freq1": gpu_freq[1].replace("MHz","").strip(),
        "gpu_freq2": gpu_freq[2].replace("MHz","").strip(),
        "gpu_freq3": gpu_freq[3].replace("MHz","").strip(),
    }])

    data.to_csv('log.csv', mode='a', header=first, index=False)
            
    first=False

    time.sleep(1)
    

