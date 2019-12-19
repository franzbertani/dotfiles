# Defined in /var/folders/zm/tv77gq0x1537zc3cqk55_vl00000gn/T//fish.9XX5JV/runsim.fish @ line 2
function runsim
	set --local options 'h/help' 't/trace=' 'o/output=' 'l/log='
    argparse $options -- $argv

    function usage
        echo "nope"
    end

    if not set --query _flag_trace; or not set --query _flag_log
        usage
        return
    end

    printf '\U1F6A8 RUNNING SIREN SIMULATION\n'
    printf '\U23F3 wait, this may take a while...\n'

    if set --query _flag_output
        siren (realpath $_flag_trace) > $_flag_output 2>&1
    else
        siren (realpath $_flag_trace)
    end

    printf '\U1F4BE SAVING LOG CSV\n'
    addtput ~/git/scheduler/datiScheduler/eventsLog.csv $_flag_log

    printf '\U2705 DONE\n'
    echo "plotapps -e $_flag_trace -l $_flag_log" | pbcopy
    printf '\U1F4C8 to plot run\nplotapps -e %s -l %s -c [COLUMNS]' $_flag_trace $_flag_log
end
