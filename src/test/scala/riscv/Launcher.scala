// See LICENSE.txt for license details.
package riscv
import chisel3.iotesters.{Driver, TesterOptionsManager}
import utils.TutorialRunner

object Launcher {
  val examples = Map(
    "Nor" -> { (manager: TesterOptionsManager) =>
        Driver.execute(() => new Nor(), manager) {
          (c) => new NorTests(c)
        }
      },
    "Xor" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Xor(), manager) {
        (c) => new XorTests(c)
      }
     },
    "And" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new And(), manager) {
        (c) => new AndTests(c)
      }
    },
    "Nand" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Nand(), manager) {
        (c) => new NandTests(c)
      }
    },
    "Or" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Or(), manager) {
        (c) => new OrTests(c)
      }
    },
    "Not" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Not(), manager) {
        (c) => new NotTests(c)
      }
    },
    "Mux" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Mux(), manager) {
        (c) => new MuxTests(c)
      }
    },
    "Mux4" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Mux4(), manager) {
        (c) => new Mux4Tests(c)
      }
    },
    "Adder" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Adder(), manager) {
        (c) => new AdderTests(c)
      }
    },
    "FullAdder2" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new FullAdder2(), manager) {
        (c) => new FullAdder2Tests(c)
      }
    },
    "FullAdder4" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new FullAdder4(), manager) {
        (c) => new FullAdder4Tests(c)
      }
    },
    "AluControl" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new AluControl(), manager) {
        (c) => new AluControlTests(c)
      }
    },
    "ImmediateGen" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new ImmediateGen(), manager) {
        (c) => new ImmediateGenTests(c)
      }
    },
    "Alu" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Alu(), manager) {
        (c) => new AluTests(c)
      }
    },
    "immGen" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new immGen(), manager) {
        (c) => new ImmGenTests(c)
      }
    },
    "TypeDecode" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new Type_Decode(), manager) {
        (c) => new TypeDecodeTests(c)
      }
    },
    "ControlDecode" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new ControlDecode(), manager) {
        (c) => new ControlDecodeTests(c)
      }
    },
    "registerFile" -> { (manager: TesterOptionsManager) =>
      Driver.execute(() => new ControlDecode(), manager) {
        (c) => new ControlDecodeTests(c)
      }
    }
  )
  def main(args: Array[String]): Unit = {
    TutorialRunner("examples", examples, args)
  }
}
