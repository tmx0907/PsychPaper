import { Link } from 'react-router-dom'

export default function HomePage() {
  return (
    <div className="min-h-screen bg-[#0a0a0f] text-[#e8e6e3] font-['Noto_Sans_KR',sans-serif] flex flex-col items-center justify-center p-6">
      <div className="text-center max-w-lg">
        <h1 className="text-4xl font-black text-[#4a9eff]">PsychPaper</h1>
        <p className="mt-2 text-[#6b6b7b]">심리학 논문 해설 & 지식 탐색 플랫폼</p>

        <div className="mt-10 p-5 rounded-xl bg-[#12121a] border border-white/10 text-left">
          <p className="text-xs uppercase tracking-wider text-[#4a9eff] font-mono mb-2">
            첫 논문
          </p>
          <Link
            to="/article/sleep-mortality-130man"
            className="block text-lg font-bold text-[#e8e6e3] hover:text-[#4a9eff] transition-colors"
          >
            잠이 부족해도, 너무 많이 자도 죽는다 — 130만 명 메타분석
          </Link>
          <p className="mt-2 text-sm text-[#6b6b7b]">
            Deep Dive · 수면 & 사망 위험 U자 곡선
          </p>
        </div>
      </div>
    </div>
  )
}
