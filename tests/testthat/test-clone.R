context("cloning functionality")
test_that("facet clones", {
  
  obj <- ggplot2::facet_grid(a+b~c+d,scales = 'free',as.table = FALSE,switch = 'x',shrink = FALSE)
  
  cloneObj <- cloneFacet(obj)
  
  my.env <- new.env()
  
  attr(obj$params$rows,'env') <- my.env
  attr(cloneObj$params$rows,'env') <- my.env
  
  attr(obj$params$cols,'env') <- my.env
  attr(cloneObj$params$cols,'env') <- my.env
  
  expect_equal(obj,cloneObj)

})

test_that("layer clones", {
  
  p <- ggplot2::ggplot(iris,ggplot2::aes(x =Sepal.Length,y=Sepal.Width))
  
  p <- p+ggplot2::geom_point(ggplot2::aes(colour=Species))+ggplot2::geom_line()
  
  obj <- p$layers[[1]]
  
  expect_equal(obj,cloneLayer(obj))
  
})

test_that("layer clones", {
  
  obj <- ggplot2::ggplot(iris,ggplot2::aes(x=Sepal.Length,y=Sepal.Width))
  
  my.env <- new.env()
  cloneObj <- cloneRoot(obj)
  
  obj$plot_env <- my.env
  cloneObj$plot_env <- my.env
  
  expect_equal(obj,cloneObj)
  
})

