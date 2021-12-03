# Simplest skill for an agent
#
import psutil


def run(hostname, formatted_date, gap):
    retval = []

    # CPU Frequencies
    #
    for idx, freq in enumerate(psutil.cpu_freq(percpu=True)):
        retval.append({
            'type': f"cpu.freq.{idx}.current",
            'hostname': hostname,
            'gap': gap,
            'utcdt': formatted_date,
            'value': freq.current,
        })
        retval.append({
            'type': f"cpu.freq.{idx}.min",
            'hostname': hostname,
            'gap': gap,
            'utcdt': formatted_date,
            'value': freq.min,
        })
        retval.append({
            'type': f"cpu.freq.{idx}.max",
            'hostname': hostname,
            'gap': gap,
            'utcdt': formatted_date,
            'value': freq.max,
        })

    # CPU Frequencies
    #
    for idx, cpu in enumerate(psutil.cpu_times_percent(percpu=True)):
        retval.append({
            'type': f"cpu.times.perc.{idx}.idle",
            'hostname': hostname,
            'gap': gap,
            'utcdt': formatted_date,
            'value': cpu.idle,
        })
        retval.append({
            'type': f"cpu.times.perc.{idx}.busy",
            'hostname': hostname,
            'gap': gap,
            'utcdt': formatted_date,
            'value': 100.0-cpu.idle,
        })

    return retval
