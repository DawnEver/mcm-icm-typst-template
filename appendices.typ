
#let first-line-indent = 20pt
#let appendices(body)={
  // show Appendices
  body
  pagebreak()

  pad(
    left: -first-line-indent
  )[#heading("Appendices", numbering: none)]

  pad(
    left: -first-line-indent,
  )[#heading("Appendices A First appendix", numbering: none)]

  par(
    hanging-indent: -first-line-indent,
  )[
    In addition, your report must include a letter to the Chief Financial Officer(CFO) of the Goodgrant Foundation, Mr. Alpha Chiang, that describes the optimal investment strategy, your modeling approach and major results, and a brief discussion of your proposed concept of a return-on-investment (ROI). This letter
    should be no more than two pages in length.

    Here are simulation programmes we used in our model as follow.
  ]
  pad(left: -first-line-indent)[#line(length: 100%, stroke: gray)]
  ```matlab
  function [t,seat,aisle]=OI6Sim(n,target,seated)
  pab=rand(1,n);
  for i=1:n
    if pab(i)<0.4
      aisleTime(i)=0;
    else
      aisleTime(i)=trirnd(3.2,7.1,38.7);
    end
  end
    ```
  pad(left: -first-line-indent)[#line(length: 100%, stroke: gray)]

  pad(
    left: -first-line-indent,
  )[#heading("Appendices B Second appendix", numbering: none)]
}