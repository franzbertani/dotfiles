# Defined in /var/folders/zm/tv77gq0x1537zc3cqk55_vl00000gn/T//fish.hGWXbp/plotapps.fish @ line 2
function plotapps --description 'Execute plotcsvcolumns.py. Parameters: -e energy source, -l log file, -t capacitor trace, -c column separated list of columns of log file to print'
	if test -n "$VIRTUAL_ENV"
        set previous_venv (basename $VIRTUAL_ENV)
    end
	workon plot
    python3 ~/git/plotter/plotcsvcolumns.py $argv
    deactivate
    if test -n "$previous_venv"
        workon $previous_venv
    end
end
