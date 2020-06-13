VULKAN_SDK_PATH = /home/cyberblast/vulkan/1.2.141.0/x86_64

CFLAGS = -std=c++17 -I$(VULKAN_SDK_PATH)/include

LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

VulkanTest : main.cpp
	g++ $(CFLAGS) -o Build/VulkanTest main.cpp $(LDFLAGS)

.PHONY: test clean

test: Build/VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/vulkan/explicit_layer.d ./Build/VulkanTest

clean:
	rm -f Build/VulkanTest

