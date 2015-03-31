CPP			    = g++
RM			    = rm -f
LOGDIR			= src/spdlog
PROTODIR 		= ../protobuf
INC				= $(LOGDIR) $(PROTODIR)
INC_PARAMS		= $(INC:%=-I%)
CPPFLAGS		= -Wall ${INC_PARAMS} -O2 -std=c++11 -g
LDFLAGS			= -lpthread -lzmqpp -lzmq -lprotobuf -luuid -Wl,--as-needed
SOURCES			= $(wildcard src/worker/*.cpp) 
TARGETS			= $(SOURCES:%.cpp=%)

all:	${TARGETS}

clean:
	${RM} *.obj *~* ${TARGETS}

${TARGETS}:
	${CPP} ${CPPFLAGS} -o $@ ${@:%=%.cpp} $(wildcard ../protobuf/bin/*.o)  ${LDFLAGS}

.PHONY: all