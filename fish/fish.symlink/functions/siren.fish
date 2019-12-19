# Defined in /var/folders/zm/tv77gq0x1537zc3cqk55_vl00000gn/T//fish.jOyrNq/siren.fish @ line 1
function siren
	java -jar /Users/francesco/siren.jar -exitwhendone -nogui -platform=exp6989 /Users/francesco/git/BatterylessSim/firmware/exp6989/main.out -autorun=/Users/francesco/git/BatterylessSim/scripts/simple.sc -voltagetrace=(realpath $argv)
end
