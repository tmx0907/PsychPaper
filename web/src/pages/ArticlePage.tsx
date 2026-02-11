import { useParams, Link } from 'react-router-dom'

const ARTICLE_SLUGS: Record<string, { title: string; path: string }> = {
  'sleep-mortality-130man': {
    title: '잠이 부족해도, 너무 많이 자도 죽는다 — 130만 명 메타분석',
    path: '/articles/sleep-mortality-130man.html',
  },
}

export default function ArticlePage() {
  const { slug } = useParams<{ slug: string }>()
  const article = slug ? ARTICLE_SLUGS[slug] : null

  if (!article) {
    return (
      <div className="min-h-screen bg-[#0a0a0f] text-[#e8e6e3] p-8">
        <Link to="/" className="text-[#4a9eff] hover:underline">← 홈</Link>
        <p className="mt-4 text-[#6b6b7b]">아티클을 찾을 수 없습니다.</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen flex flex-col bg-[#0a0a0f]">
      <header className="flex items-center justify-between px-4 py-3 border-b border-white/10 shrink-0">
        <Link to="/" className="text-[#4a9eff] hover:underline font-medium">
          ← PsychPaper
        </Link>
        <span className="text-sm text-[#6b6b7b] truncate max-w-[60%]">{article.title}</span>
      </header>
      <iframe
        title={article.title}
        src={article.path}
        className="w-full flex-1 min-h-0 border-0"
      />
    </div>
  )
}
