package org.example.searchbookmark.service;

import org.apache.ibatis.session.SqlSession;
import org.example.searchbookmark.config.MyBatisConfig;
import org.example.searchbookmark.model.mapper.BookmarkMapper;
import org.example.searchbookmark.model.vo.KeywordSearch;
import org.example.searchbookmark.model.vo.NaverSearchParam;
import org.example.searchbookmark.util.MyLogger;
import org.example.searchbookmark.util.NaverSearchAPI;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookmarkService{

    final public MyLogger logger = new MyLogger(this.getClass().getName());

    public void createBookmark(KeywordSearch keywordSearch) {
        try (SqlSession session = MyBatisConfig.getSqlSessionFactory().openSession()) {
            BookmarkMapper mapper = session.getMapper(BookmarkMapper.class);
            int count = mapper.insertBookmark(keywordSearch);
            logger.info(count + " bookmark inserted");
            session.commit();
        }
    }
}
