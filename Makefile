SOURCES=main.cpp some_class.cpp
GXX_FLAGS=-std=c++11 -O2 -pipe -MMD -MP
BUILD_DIR=bin/
OUTPUT_NAME=my_project_name

all: $(OUTPUT_NAME)

$(OUTPUT_NAME): $(SOURCES:%.cpp=$(BUILD_DIR)%.o)
	g++ $(GXX_FLAGS) -o $@ $^

$(SOURCES:%.cpp=$(BUILD_DIR)%.o): $(BUILD_DIR)%.o : %.cpp $(BUILD_DIR)
	g++ $(GXX_FLAGS) -c -o $@ $<

$(BUILD_DIR):
	mkdir $@

clean:
	rm -rf $(BUILD_DIR) $(OUTPUT_NAME)

-include $(SOURCES:%.cpp=$(BUILD_DIR)%.d)
