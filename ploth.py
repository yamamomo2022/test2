import matplotlib.pyplot as plt
import numpy as np

plt.rcParams['xtick.direction'] = 'in'
plt.rcParams['ytick.direction'] = 'in'
plt.tight_layout()
# plt.grid(True)
    

hmax = 250
hmin = 100

def f(x: float,a: float = 1.0) -> float:
    return a*x

if __name__ == "__main__":
    x = np.arange(hmin, hmax, 1)

    plt.plot(x, f(x,1.55))
    plt.plot(x, f(x,2.4))
    
    plt.xlabel('h')
    plt.ylabel('h@2500')
    # plt.title('Plot')
    plt.ylim(250, 450)
    plt.xlim(hmin, hmax)
    plt.show()

    # plt.gcf().savefig('./output.png') 
