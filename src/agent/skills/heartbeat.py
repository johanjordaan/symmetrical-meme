# Simplest skill for an agent
#

def run(hostname, formatted_date, gap):
    retval = {
        'type': 'heartbeat',
        'hostname': hostname,
        'gap': gap,
        'utcdt': formatted_date,
        'value': 1,
    }
    return [retval]
