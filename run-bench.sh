#!/system/bin/bash

cd /data/local/tmp

# run small cores cluster
function run-small()
{
  for num in `seq 1 4`
  do
    ./benchncnn 8 $num 1 -1 1 > bench-small-$num.log 2>&1
    sleep 10
  done
}


# run big cores cluster
function run-big()
{
  for num in `seq 1 4`
  do
    ./benchncnn 8 $num 2 -1 1 > bench-big-$num.log 2>&1
    sleep 10
  done
}

# run gpu
function run-gpu()
{
  for num in `seq 1 4`
  do
    ./benchncnn 8 $num 2 0 0 > bench-gpu-big-$num.log 2>&1
    sleep 10
  done

  for num in `seq 1 4`
  do
    ./benchncnn 8 $num 1 0 0 > bench-gpu-small-$num.log 2>&1
    sleep 10
  done
}

# run npu
function run-npu()
{
  echo "todo"
}


# ref:https://blog.csdn.net/liufei_learning/article/details/7999207
while  getopts  " bsgn "  arg #选项后面的冒号表示该选项需要参数
do
     case  $arg  in
         s)
            echo  " start to run small cores cluster benchmark "
            run-small
            ;;
         b)
            echo  " start to run big cores cluster benchmark "
            run-big
            ;;
         g)
            echo  " start to run gpu benchmark "
            run-gpu
            ;;
         n)
           echo  " start to run npu benchmark "
           run-npu
            ;;
          ? )  #当有不认识的选项的时候arg为 ?
        echo  " unkonw argument "
    exit  1
    ;;
    esac
done
