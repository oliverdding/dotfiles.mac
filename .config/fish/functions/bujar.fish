function bujar --description 'assembly jar file of QAPM/emr'
    if not set -q QAPM_HOME
        echo "🤔 cannot find environment variable QAPM_HOME"
        return 1
    end
    fish -c "
    cd $QAPM_HOME/emr/spark/scala/QAPMSparkProject
    sbt assembly &>/dev/null
    " &
    function bujar_ended --on-process-exit $last_pid
        if test $argv[3] = 0
            terminal-notifier -title 'bujar' \
                -subtitle '🥳' \
                -group qapm \
                -ignoreDnD \
                -sender $__CFBundleIdentifier \
                -message "bujar finished with assembly file at $QAPM_HOME/emr/spark/scala/QAPMSparkProject/target/scala-2.11/QAPMSparkProject-assembly-6.1.jar"
        else
            terminal-notifier -title 'bujar' \
                -subtitle '☹️' \
                -group qapm \
                -ignoreDnD \
                -sender $__CFBundleIdentifier \
                -message "bujar failed with error code $statue"
        end
    end
end
