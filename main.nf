#!/usr/bin/env nextflow

process sayHello {
    tag "$greeting"

    input:
    val greeting

    output:
    tuple val(greeting), path('hello.done')

    script:
    """
    echo '${greeting} world! Sleeping for ${params.sleep} seconds.'
    sleep ${params.sleep}
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
    echo 'GOODBYE ${greeting} world! Sleeping for ${params.sleep} seconds.'
    sleep ${params.sleep}
    """
}

workflow {
    ch_greetings = channel.of('Bonjour', 'Ciao', 'Hello', 'Hola')

    ch_hello_done = sayHello(ch_greetings)

    sayGoodbye(ch_hello_done).view()
}
