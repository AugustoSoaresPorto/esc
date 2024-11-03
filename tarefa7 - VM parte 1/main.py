from vm_tradutor import TradutorVM 
import sys

def main():
    name = sys.argv[1].split('.')[0]
    vm = TradutorVM(name)
    vm.traduzir()
    
if __name__ == "__main__":
    main()  