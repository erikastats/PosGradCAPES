#' Construir um mapa temático
#'
#' @param dataset Dados com uma coluna id com as UFs e uma coluna variavel com os valores a serem inserido
#'
#' @return Gráfico com shape do Brasil

constroi_mapa_tematico <- function(dataset){
  dataset %>% 
    inner_join(abjData::br_uf_map) %>% {
      ggplot(.) +
        geom_map(aes(x = long, y = lat,
                     map_id = id, fill = variavel),
                 color = 'gray20', map = ., data = .) + 
        theme_void() +
        coord_equal()
    }
}
