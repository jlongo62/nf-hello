#!/usr/bin/env nextflow

process sayHello {
    input:
    val greeting

    output:
    stdout

    script:
    """
    echo '${greeting} world!'
    sleep 5
    """
}

process sayGoodbye {
    input:
    val greeting

    output:
    stdout

    script:
    """
    echo 'GOODBYE ${greeting} world!'
    sleep 5
    """
}
workflow {
    ch_greetings = channel.of('Bonjour', 'Ciao', 'Hello', 'Hola')
    sayHello(ch_greetings).view()
    sayGoodbye(ch_greetings).view()
}
