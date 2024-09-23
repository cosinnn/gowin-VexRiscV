<p align="center">
<img src="./logo.png" width="60%" >
</p>


[![GitHubStars](https://img.shields.io/github/stars/RT-Thread/rt-thread?style=flat-square&logo=GitHub)](https://github.com/RT-Thread/rt-thread/stargazers)
[![GiteeStars](https://gitee.com/rtthread/rt-thread/badge/star.svg?theme=gvp)](https://gitee.com/rtthread/rt-thread/stargazers)
[![GitHub](https://img.shields.io/github/license/RT-Thread/rt-thread.svg)](https://github.com/RT-Thread/rt-thread/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/RT-Thread/rt-thread.svg)](https://github.com/RT-Thread/rt-thread/releases)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/RT-Thread/rt-thread?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/RT-Thread/rt-thread.svg)](https://github.com/RT-Thread/rt-thread/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat)](https://github.com/RT-Thread/rt-thread/pulls)

## 团队简介

我们是‘烧黏先疯队’，隶属于SZTU集成电路学院创芯社，致力于参加各类集成电路相关竞赛，为集成电路产业的发展注入新鲜血液。我们有着丰富的集成电路与FPGA设计、验证、调试经验，拥有多年的团队管理经验，并积极参与各类开源项目的开发。

# VexRiscv 介绍

## **VexRiscv架构**

VexRiscv是一个高性能、可配置的RISC-V处理器核心，适用于嵌入式系统。它的架构如下：

- **内核层**：VexRiscv内核是其核心部分，支持多种指令集配置，包括RV32I、RV64I等。它支持多级流水线设计，提供了高效的指令执行和丰富的外设接口。

- **功能模块层**：VexRiscv包含多个功能模块，如中断控制、时钟管理、缓存控制和调试接口等。这些模块设计为高度模块化，使得用户能够根据需求进行定制和扩展。

- **开发工具和生态**：VexRiscv支持多种开发工具，提供了丰富的开发文档和示例代码，帮助开发者快速上手。它还兼容主流的RISC-V工具链，支持软件开发和硬件仿真。

## VexRiscv的特点

- **高度可配置**：支持多种配置选项，开发者可以根据应用需求灵活定制。

- **性能优越**：采用先进的流水线设计，提供高效的指令执行和低延迟。

- **开放源代码**：作为开源项目，开发者可以自由使用、修改和分发源代码。

- **强大的社区支持**：拥有活跃的开发者社区，提供持续的更新和技术支持。

- **多种应用场景**：适用于嵌入式系统、物联网设备、人工智能加速等多种场景。

## **代码目录**

VexRiscv源代码目录结构如下：

| 名称          | 描述                                                    |
| ------------- | ------------------------------------------------------- |
| cores         | VexRiscv核心代码，包含处理器核心的实现                 |
| simulations    | VexRiscv的仿真测试代码，支持不同仿真环境               |
| documentation | 相关文档，包括用户手册和开发指南                        |
| examples      | 示例代码，展示如何使用VexRiscv进行开发                 |
| include       | VexRiscv核心的头文件                                   |
| tools         | 辅助工具，如构建脚本和配置工具                          |

## **资源文档**

### **硬件支持**

VexRiscv支持多种RISC-V架构，兼容主流的开发板和FPGA平台，包括：

- RV32I/RV64I架构：适用于多种嵌入式应用
- FPGA实现：可在Xilinx、Intel等平台上进行开发
- 开发板支持：与多种开发板兼容，支持快速原型设计

### **支持的IDE和编译器**

VexRiscv主要支持的IDE/编译器包括：

- GNU工具链（GCC）

- RISC-V专用工具链

- Vivado和Quartus（用于FPGA开发）

## **快速上手**

VexRiscv核心可以直接在FPGA或开发板上实现。为帮助用户快速上手，提供了详细的入门指南和示例项目：

[入门指南](./quick_start_vexriscv.md)

通过这些资源，开发者可以快速搭建基于VexRiscv的系统，进行应用开发。