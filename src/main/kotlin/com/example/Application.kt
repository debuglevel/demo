package com.example

import mu.KotlinLogging
import io.micronaut.runtime.Micronaut.*

fun main(args: Array<String>) {
	val logger = KotlinLogging.logger {}
	logger.info("Starting up...");
	run(*args)
}