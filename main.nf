#!/usr/bin/env nextflow

process sayHello {
    tag "$greeting"

    input:
    val greeting

    output:
    tuple val(greeting), path('hello.done')

    script:
    """
    echo "HELLO ${greeting} world! Sleeping for \$SLEEP seconds."
    sleep "\$SLEEP"
    touch hello.done
    """
}

process sayGoodbye {
    tag "$greeting"

    input:
    tuple val(greeting), path(hello_done)

    output:
    stdout

    script:
    """
    echo "GOODBYE ${greeting} world! Sleeping for \$SLEEP seconds."
    sleep "\$SLEEP"
    """
}

workflow {
    ch_greetings = channel.of('Bonjour', 'Ciao', 'Hello', 'Hola')

    ch_hello_done = sayHello(ch_greetings)

    sayGoodbye(ch_hello_done).view()
}
