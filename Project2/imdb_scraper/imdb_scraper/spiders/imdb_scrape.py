import scrapy


class ImdbScrapeSpider(scrapy.Spider):
    name = "imdb_scrape"
    allowed_domains = ["www.imdb.com"]
    start_urls = ["https://www.imdb.com/chart/top/?ref_=nv_mv_250"]

    def parse(self, response):
        imdb_scrapes=response.css('div.ipc-metadata-list-summary-item__c')
        for imdb_scrape in imdb_scrapes:
            yield{
                'Title': imdb_scrape.css('a h3.ipc-title__text::text').get(),
                'Year': imdb_scrape.css('span.cli-title-metadata-item::text').get(),
                'Ratings': imdb_scrape.css('span.ipc-rating-star--rating::text').get()
            }
            
