PART=LM4F120H5QR
VARIANT=cm4f
ROOT=..
include ${ROOT}/makedefs
IPATH=..
all: ${COMPILER}
all: ${COMPILER}/float_speed.axf
clean:
	@rm -rf ${COMPILER} ${wildcard *~}
${COMPILER}:
	@mkdir -p ${COMPILER}
${COMPILER}/float_speed.axf: ${COMPILER}/startup_${COMPILER}.o
${COMPILER}/float_speed.axf: ${COMPILER}/float_speed.o
${COMPILER}/float_speed.axf: ${ROOT}/driverlib/${COMPILER}-cm4f/libdriver-cm4f.a
${COMPILER}/float_speed.axf: float_speed.ld
SCATTERgcc_float_speed=float_speed.ld
ENTRY_float_speed=ResetISR
CFLAGSgcc=-DTARGET_IS_BLIZZARD_RA1
ifneq (${MAKECMDGOALS},clean)
-include ${wildcard ${COMPILER}/*.d} __dummy__
endif

