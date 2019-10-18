﻿using YAF.Lucene.Net.Analysis.Standard;
using System.Collections.Generic;
using System.IO;
using TokenizerFactory = YAF.Lucene.Net.Analysis.Util.TokenizerFactory;

namespace YAF.Lucene.Net.Analysis.Standard
{
    /*
    * Licensed to the Apache Software Foundation (ASF) under one or more
    * contributor license agreements.  See the NOTICE file distributed with
    * this work for additional information regarding copyright ownership.
    * The ASF licenses this file to You under the Apache License, Version 2.0
    * (the "License"); you may not use this file except in compliance with
    * the License.  You may obtain a copy of the License at
    *
    *     http://www.apache.org/licenses/LICENSE-2.0
    *
    * Unless required by applicable law or agreed to in writing, software
    * distributed under the License is distributed on an "AS IS" BASIS,
    * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    * See the License for the specific language governing permissions and
    * limitations under the License.
    */

    /// <summary>
    /// Factory for <see cref="ClassicTokenizer"/>.
    /// <code>
    /// &lt;fieldType name="text_clssc" class="solr.TextField" positionIncrementGap="100"&gt;
    ///   &lt;analyzer&gt;
    ///     &lt;tokenizer class="solr.ClassicTokenizerFactory" maxTokenLength="120"/&gt;
    ///   &lt;/analyzer&gt;
    /// &lt;/fieldType&gt;</code>
    /// </summary>
    public class ClassicTokenizerFactory : TokenizerFactory
    {
        private readonly int maxTokenLength;

        /// <summary>
        /// Creates a new <see cref="ClassicTokenizerFactory"/> </summary>
        public ClassicTokenizerFactory(IDictionary<string, string> args)
            : base(args)
        {
            AssureMatchVersion();
            maxTokenLength = GetInt32(args, "maxTokenLength", StandardAnalyzer.DEFAULT_MAX_TOKEN_LENGTH);
            if (args.Count > 0)
            {
                throw new System.ArgumentException("Unknown parameters: " + args);
            }
        }

        public override Tokenizer Create(Net.Util.AttributeSource.AttributeFactory factory, System.IO.TextReader input)
        {
            ClassicTokenizer tokenizer = new ClassicTokenizer(m_luceneMatchVersion, factory, input);
            tokenizer.MaxTokenLength = maxTokenLength;
            return tokenizer;
        }
    }
}